# about this image
* Debian 9 where OpenBabel and Jupyter notebook installed
* Jupyter setting
```/root/.jupyter/jupyter_notebook_config.py 
 c.NotebookApp.allow_root = True  
 c.NotebookApp.ip = '*'  
 c.NotebookApp.open_browser = False  
 c.NotebookApp.notebook_dir = '/notebook'  
 c.NotebookApp.token = 'pass'  
```
---
# Notes
* build  
```sh:console
 sudo docker build -t sin1/pybel .  
```
* run
```sh:console
 sudo docker run -itd -v "/notebook:/notebook" -p "8889:8888" --name babel sin1/pybel
```

---

# Software dependencies
| Software component | version |
|:-----------|:------------|
| jupyter | 4.3.0 |
| python2 | 2.7.13 |
| moldesign | 0.7.0 |
| openbabel | 4.0.2 |
| GNU Compiler Collection | 6.3.0 |

# Sample code
```sample.ipynb
 import nbmolviz
 import pybel
 mol = pybel.readstring( "smi","C1=NC2=C(N1)C(=NC=N2)N" )
 mol.make3D()
 nbmolviz.visualize(mol)
```
![3D Model](https://github.com/Dr-Sin1/pybel/blob/master/sample.GIF)
