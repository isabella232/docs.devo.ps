#!/usr/bin/env python

import os
import yaml
import re

menu = {
    'references': {},
    'manual': []
}

try:
    # References
    for ref in [i for i in os.listdir('references') if i.endswith('.md')]:
        name = ref.replace('.md', '')
        with open(os.path.join('references', ref), 'r') as f:
            data = f.read()
            # Keep only the yaml header
            delimiter = data.index('---\n', 2)
            data = data[:delimiter]
            content = yaml.safe_load(data)
        
        content_type = content.get('tags', ['misc'])[0]
        menu['references'].setdefault(content_type, [])
        menu['references'][content_type].append({
            'title': content.get('title'),
            'name': name
        })
except Exception as e:
    print e
    print 'skipping'

try:
    # Manual - rely on the _Sidebar.md file
    manual_menu = []
    with open('manual/_Sidebar.md', 'r') as f:
        for line in f.readlines():
            if not '[[' in line:
                # unchanged line
                manual_menu.append(line)
            else:
                r = re.search('(.*)\[\[([^\[\]]+)\]\](.*)', line)
                if r:
                    title = r.group(2).strip()
                    filename = title.replace(' ', '-')
                    new_line = r.group(1) +'['+ title +'](/manual/'+ filename +'.html)'+ r.group(3)
                    manual_menu.append(new_line)
                    header = {'title': title, 'layout': 'page'}
                    with open(os.path.join('manual', filename +'.md'), 'rw+') as m:
                        content = m.read()
                        m.seek(0)
                        m.write(yaml.safe_dump(header, explicit_start=True, default_flow_style=False))
                        m.write('\n---\n'+ content)

                else:
                    manual_menu.append(line)

    with open('menu/manual.md', 'w') as f:
        f.write('\n'.join(manual_menu))


    # for man in [i for i in os.listdir('manual') if i.endswith('.md')]:
    #     name = man.replace('.md', '')
    #     title = name.replace('-', ' ')
    #     menu['manual'].append({
    #         'title': title,
    #         'name': name
    #     })
    #     # MD is not processed natively by jekyll, need to add frontmatter header
    #     header = {'title': title, 'layout': 'page'}
    #     with open(os.path.join('manual', man), 'w+r') as f:
    #         content = f.read()
    #         f.seek(0)
    #         f.write(yaml.safe_dump(header, explicit_start=True, default_flow_style=False))
    #         f.write('\n---\n'+ content)

except Exception as e:
    print e
    print 'skipping'

# with open('_data/menu.yml', 'w') as a:
#     a.write(yaml.safe_dump(menu, explicit_start=True, default_flow_style=False))
