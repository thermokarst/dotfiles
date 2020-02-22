import json


qiime2_projects = [
    'Keemei',
    'busywork',
    'data.qiime2.org',
    'dev-docs',
    'discourse-unhandled-tagger',
    'docs',
    'environment-files',
    'galaxy',
    'library',
    'logos',
    'q2-alignment',
    'q2-composition',
    'q2-cutadapt',
    'q2-dada2',
    'q2-deblur',
    'q2-demux',
    'q2-diversity',
    'q2-diversity-lib',
    'q2-emperor',
    'q2-feature-classifier',
    'q2-feature-table',
    'q2-fragment-insertion',
    'q2-gneiss',
    'q2-longitudinal',
    'q2-metadata',
    'q2-phylogeny',
    'q2-quality-control',
    'q2-quality-filter',
    'q2-sample-classifier',
    'q2-taxa',
    'q2-types',
    'q2-vsearch',
    'q2cli',
    'q2cwl',
    'q2galaxy',
    'q2studio',
    'q2templates',
    'q2view',
    'qiime2',
    'qiime2.github.io',
    'template-repo',
    'view.qiime2.org',
    'vm-playbooks',
    'workshop-playbooks',
    'workshops.qiime2.org',
]

thermokarst_projects = [
    'ccdb-api',
    'ccdb-web',
    'fathm',
    'tucotuco',
]

cap_lab_projects = [
    'caporaso-lab.github.io',
    'pretrained-feature-classifiers',
]

gregcaporaso_projects = [
    'caporaso-lab-secrets',
    'qiime2-meta-figures',
]

projects = []

def record(proj, path, group):
    return {
        'name': proj.lower(),
        'rootPath': '/'.join([path, proj]),
        'paths': [],
        'group': group,
        'enabled': True,
    }

for proj in qiime2_projects:
    projects.append(record(proj, '$home/src/qiime2', 'qiime2'))

for proj in thermokarst_projects:
    projects.append(record(proj, '$home/src/thermokarst', 'thermokarst'))

for proj in cap_lab_projects:
    projects.append(record(proj, '$home/src/caporaso-lab', 'caporaso-lab'))

for proj in gregcaporaso_projects:
    projects.append(record(proj, '$home/src/gregcaporaso', 'gregcaporaso'))

projects.append({
    'name': 'dotfiles',
    'rootPath': '$home/.dotfiles',
    'paths': [],
    'group': '',
    'enabled': True,
})

with open('vscode/projects.json', 'w') as fh:
    json.dump(projects, fh, sort_keys=True, indent=4)