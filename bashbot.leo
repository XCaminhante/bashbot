<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="https://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="caminhante.20230226160006.1"><vh>@settings</vh>
<v t="caminhante.20200618180759.1"><vh>@command terminal-here @key=Alt-T</vh></v>
<v t="caminhante.20230226160006.2"><vh>@data abbreviations</vh></v>
<v t="caminhante.20230226160006.3"><vh>@outline-data tree-abbreviations</vh>
<v t="caminhante.20240620151434.3"><vh>leo;;</vh>
<v t="caminhante.20240628154530.1"><vh>@ignore</vh>
<v t="caminhante.20240620151702.1"><vh>@clean blank.leo</vh></v>
</v>
</v>
</v>
<v t="caminhante.20230226160006.4"><vh>nodeActions</vh>
<v t="caminhante.20230421001433.1"><vh>@bin *</vh></v>
<v t="caminhante.20200604232050.1"><vh>@cmd *</vh></v>
<v t="caminhante.20211012181130.1"><vh>@cp *</vh></v>
<v t="caminhante.20211113172701.1"><vh>@files Makefile</vh></v>
<v t="caminhante.20210501142945.2"><vh>@mkdir *</vh></v>
<v t="caminhante.20211012180812.1"><vh>@mv *</vh></v>
<v t="caminhante.20210905232208.1"><vh>@rm *</vh></v>
<v t="caminhante.20210501142945.4"><vh>@rmdir /*/</vh></v>
<v t="caminhante.20200618203115.1"><vh>@run|@run .* [X]</vh></v>
<v t="caminhante.20230410165201.1"><vh>\@edit * [X]</vh></v>
<v t="caminhante.20230623143806.1"><vh>\@file * [X]</vh></v>
<v t="caminhante.20230623181912.1"><vh>/*/</vh></v>
<v t="caminhante.20231002175916.1"><vh>\@path * [X]</vh></v>
<v t="caminhante.20240307132645.1"><vh>@*</vh></v>
<v t="caminhante.20230623144919.1"><vh>*</vh></v>
</v>
</v>
<v t="caminhante.20240809173201.2"><vh>BashBot para coletores Cognitivos</vh>
<v t="caminhante.20240809173339.1"><vh>@path .</vh>
<v t="caminhante.20240809173341.7"><vh>.gitignore</vh></v>
<v t="caminhante.20240809173341.6"><vh>/.git/</vh></v>
<v t="caminhante.20240809173341.5"><vh>/commands/</vh>
<v t="caminhante.20240814175600.1"><vh>@edit insult</vh></v>
<v t="caminhante.20240814175436.1"><vh>@edit info</vh></v>
<v t="caminhante.20240812155531.1"><vh>@cmd chmod -v +x ./</vh></v>
<v t="caminhante.20240812164018.1"><vh>@edit test</vh></v>
<v t="caminhante.20240812155523.1"><vh>@edit exec</vh></v>
<v t="caminhante.20240809173344.3"><vh>@edit join</vh></v>
<v t="caminhante.20240812162952.1"><vh>@edit mac</vh></v>
<v t="caminhante.20240809173344.2"><vh>@edit part</vh></v>
<v t="caminhante.20240809173344.1"><vh>@edit ping</vh></v>
<v t="caminhante.20240812163201.1"><vh>@edit status</vh></v>
<v t="caminhante.20240812163955.1"><vh>@edit download</vh></v>
<v t="caminhante.20240812164000.1"><vh>@edit upload</vh></v>
</v>
<v t="caminhante.20240809173341.4"><vh>/filters/</vh>
<v t="caminhante.20240809173452.1"><vh>@edit simple_filters.sh</vh></v>
</v>
<v t="caminhante.20240809173341.2"><vh>@file bashbot</vh></v>
<v t="caminhante.20240809173341.1"><vh>bashbot.leo</vh></v>
<v t="caminhante.20240809194530.1"><vh>bashbot.leo.bak</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="caminhante.20200604232050.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@cmd ')[1:])
command = "cat &lt;&lt;'EOFEOFEOFEOFEOFEOF' | bash\n"+command+'\nEOFEOFEOFEOFEOFEOF'
g.es(c.p.h)
c.p.b += execute(command)

c.save()
</t>
<t tx="caminhante.20200618180759.1">@language python
import subprocess

def execute (cmd):
    return subprocess.Popen(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()
path = c.getNodePath(c.p)

execute('x-terminal-emulator --working-directory="'+path+'"')
</t>
<t tx="caminhante.20200618203115.1">@language python
import subprocess

# def getpath (p):
    # dict = c.scanAllDirectives(p)
    # d = dict.get("path")
    # if p.isAnyAtFileNode():
        # filename = p.anyAtFileNodeName()
        # filename = g.os_path_join(d,filename)
        # if filename:
            # d = g.os_path_dirname(filename)
    # if d is None:
        # return ""
    # else:
        # return g.os_path_normpath(d)

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
# g.os.chdir(path)

w = c.frame.body.wrapper
s1,s2 = w.getSelectionRange()

if s1 == s2:
    code = c.p.b
else:
    linebr = c.p.b.find('\n',s2)
    if linebr == -1: linebr = len(c.p.b)
    code = c.p.b[s1:s2]

g.es(c.p.h)

command = "cat &lt;&lt;'EOFEOFEOFEOFEOFEOF' | bash\ncd '"+path+"';\n"+code+'\nEOFEOFEOFEOFEOFEOF'

if c.isChanged(): c.save()

cpc = c.p.copy()
novoNo = cpc.insertAsLastChild()
novoNo.h = c.p.h + ' ['+code[0:6]+'...]'
novoNo.b = execute(command)

c.save()
w.setSelectionRange(s1,s2)
c.redraw(c.p)
</t>
<t tx="caminhante.20210501142945.2">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

path = ''.join(c.p.h.split('@mkdir ')[1:])
cmd = "mkdir -p -- '" + path + "'"
g.es(c.p.h)
execute(cmd)
c.p.h = '/'+path+'/'
c.p.b = '@path ' + path
</t>
<t tx="caminhante.20210501142945.4">import subprocess
import shutil

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

ps = c.p.parents()
for par in ps:
    break
path = c.getNodePath(par)
g.os.chdir(path)

path = ''.join(c.p.h.split('@rmdir /')[1:]).split('/')[0]
shutil.rmtree(path)
c.p.b = 'deleted'
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20210905232208.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

filename = ''.join(c.p.h.split('@rm ')[1:])
cmd = 'rm -vf -- "' + filename + '"'
g.es(c.p.h)
g.es(execute(cmd))
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20211012180812.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@mv ')[1:])
command = "mv -v "+command
g.es(c.p.h)
c.p.b += execute(command)

c.save()
</t>
<t tx="caminhante.20211012181130.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@cp ')[1:])
command = "cp -v "+command
g.es(c.p.h)
c.p.b += execute(command)

c.save()
</t>
<t tx="caminhante.20211113172701.1">@language python
import subprocess
import re

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

cpc = c.p.copy()
novoNo = cpc.insertAfter()
novoNo.h = 'make return'
novoNo.b = execute('make')
c.redraw(c.p)
</t>
<t tx="caminhante.20230226160006.1">@tabwidth -2
</t>
<t tx="caminhante.20230226160006.2"></t>
<t tx="caminhante.20230226160006.3">leo;;
</t>
<t tx="caminhante.20230226160006.4">@language python
</t>
<t tx="caminhante.20230410165201.1">path = ''.join(c.p.h.split('@edit ')[1:])
c.p.h = path
c.p.b = ''
</t>
<t tx="caminhante.20230421001433.1">import subprocess

def execute (cmd):
  return subprocess.run(
    cmd,shell=True,
    universal_newlines=True,
    stderr=subprocess.STDOUT,
    stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@bin ')[1:])
command = "xxd -- '"+command+"'"

g.es(c.p.h)
c.p.b = execute(command)

c.save()
</t>
<t tx="caminhante.20230623143806.1">path = ''.join(c.p.h.split('@file ')[1:])
c.p.h = path
c.p.b = ''
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20230623144919.1"># g.os.chdir(path)
path = c.getNodePath(c.p)

import re

def fileHasPattern (fname, pattern):
  fp = open(path +'/'+ fname)
  for i, line in enumerate(fp):
    if i == 50:
      break
    if re.search(pattern, line):
      return True
  return False

def loadFileNode (ftype,fname):
  at = c.atFileCommands
  c.p.deleteAllChildren()
  c.p.h = "@"+ftype+" "+fname
  c.recreateGnxDict()
  at.readFileAtPosition(c.p)

if fileHasPattern(c.p.h, r"leo-ver=5-thin"):
  loadFileNode('file', c.p.h)
elif fileHasPattern(c.p.h, r"&lt;leo_file xmlns:leo="):
  g.openWithFileName(path +'/'+ c.p.h)
else:
  loadFileNode('edit', c.p.h)

c.p.setDirty()
c.redraw(c.p)
c.p.contract()
</t>
<t tx="caminhante.20230623181912.1">c.p.deleteAllChildren()
c.p.setDirty()
c.redraw(c.p)
</t>
<t tx="caminhante.20231002175916.1">c.p.deleteAllChildren()
c.p.setDirty()
c.redraw(c.p)
</t>
<t tx="caminhante.20240307132645.1"></t>
<t tx="caminhante.20240620151434.3"></t>
<t tx="caminhante.20240620151702.1">{|{idx = 3; t_u = g.os.environ['USER'];}|}{|{t_s = g.time.strftime("%Y%m%d%H%M%S", g.time.localtime()); t_gnx=f"{t_u}.{t_s}.{idx}";}|}&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html --&gt;
&lt;leo_file xmlns:leo="https://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" &gt;
&lt;leo_header file_format="2"/&gt;
&lt;globals/&gt;
&lt;preferences/&gt;
&lt;find_panel_settings/&gt;
&lt;vnodes&gt;
&lt;v t="{|{x=t_gnx;}|}"&gt;&lt;vh&gt;Blank project&lt;/vh&gt;&lt;/v&gt;
&lt;/vnodes&gt;
&lt;tnodes&gt;
&lt;t tx="{|{x=t_gnx;}|}"&gt;&lt;/t&gt;
&lt;/tnodes&gt;
&lt;/leo_file&gt;
</t>
<t tx="caminhante.20240628154530.1"></t>
<t tx="caminhante.20240809173201.2"></t>
<t tx="caminhante.20240809173339.1">@tabwidth -2</t>
<t tx="caminhante.20240809173341.1"></t>
<t tx="caminhante.20240809173341.4">@path filters</t>
<t tx="caminhante.20240809173341.5">@path commands</t>
<t tx="caminhante.20240809173341.6">@path .git</t>
<t tx="caminhante.20240809173341.7"></t>
<t tx="caminhante.20240809194530.1"></t>
<t tx="caminhante.20240812155531.1"></t>
</tnodes>
</leo_file>
