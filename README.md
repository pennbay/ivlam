## 打包
```
python -m build
```

## 分发
```
twine upload  dist/* --repository-url http://ps-ynao.duckdns.org:8080
```

## 安装
```
pip search tblam -i http://ps-ynao.duckdns.org:8080
pip install tblam --extra-index-url http://ps-ynao.duckdns.org:8080 --trusted-host ps-ynao.duckdns.org
```