#!/usr/bin/env python

import os
import yaml
import re

#
# References - create a source/references.yml file 
#
try:
    menu = []
    for ref in [i for i in os.listdir('source/references') if i.endswith('.md')]:
        name = ref.replace('.md', '')
        with open(os.path.join('source/references', ref), 'r') as f:
            data = f.read()
            # Keep only the yaml header
            delimiter = data.index('---\n', 2)
            data = data[:delimiter]
            content = yaml.safe_load(data)
        
        menu.append({
            'title': content.get('title'),
            'name': name
        })

    # Sort by ascending title
    menu.sort(key=lambda i: i['title'])
    with open('source/references.yaml', 'w') as f:
        f.write(yaml.safe_dump(menu, explicit_start=True, default_flow_style=False))

except Exception as e:
    print e
    print 'skipping'

#
# Manual - rely on the _Sidebar.md file and add the yaml header to each md file
# 
try:
    menu = []
    with open('source/manual/_Sidebar.md', 'r') as f:
        for line in f.readlines():
            if not '[[' in line:
                # unchanged line
                menu.append(line)
            else:
                r = re.search('(.*)\[\[([^\[\]]+)\]\](.*)', line)
                if r:
                    title = r.group(2).strip()
                    filename = title.replace(' ', '-')
                    new_line = r.group(1) +'['+ title +'](/manual/'+ filename +'.html)'+ r.group(3)
                    menu.append(new_line)
                    header = {
                        'title': title, 
                        'template': 'page.html',
                        'include': {
                            'menu_manual': 'manual.html'
                        }
                    }
                    target_file = os.path.join('source/manual', filename +'.md')
                    if os.path.exists(target_file):
                        with open(target_file, 'r+') as m:
                            content = m.read()
                            m.seek(0)
                            m.write(yaml.safe_dump(header, explicit_start=True, default_flow_style=False))
                            m.write('\n---\n'+ content)

                else:
                    menu.append(line)

    with open('source/manual.md', 'w') as f:
        f.write('---\npartial: true\n---\n')
        f.write('\n'.join(menu))

except Exception as e:
    print e
    print 'skipping'

# with open('_data/menu.yml', 'w') as a:
#     a.write(yaml.safe_dump(menu, explicit_start=True, default_flow_style=False))
