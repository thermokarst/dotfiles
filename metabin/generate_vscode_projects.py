import json
import os

from projects import PROJECTS


folders = []
for org, repos in PROJECTS.items():
    for repo in repos:
        folders.append({
            'name': repo.lower(),
            'path': os.path.join(os.sep, 'Users', 'matthew', 'src', org, repo)
        })


folders.append({'name': 'dotfiles',
                'path': os.path.join(os.sep, 'Users', 'matthew', '.dotfiles')})


with open('vscode/qiime2.code-workspace', 'w') as fh:
    json.dump({'folders': sorted(folders, key=lambda x: x['name'])}, fh, sort_keys=True, indent=4)
