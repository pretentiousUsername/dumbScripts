import os

title = 'foo' # Book title or whatever
path = 'src/' # Path all your markdown files are in
templateFile = 'bar.tex'

files = os.listdir(path)
files.sort()
files.remove(path + title + '.tex')
if os.path.exists(title + '.md'):
    os.remove(path + title + '.md')
files.sort()
print(files)

with open(title + '.md', 'w') as mI:
    for i in files:
        for line in open(str(path + i), 'r'):
            mI.write(line)

template = ' --template=' + templateFile
pdf = ' --pdf-engine=xelatex'
output = ' -o ' + title + '.pdf'
output2 = ' -o' + title + '.tex'

command = 'pandoc ' + path + title + '.md' + template + pdf + output
command2 = 'pandoc ' + path + title + '.md' + template + pdf + output2

os.system(command)
os.system(command2)

os.remove(path + title + '.md')

