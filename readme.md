## BaseElectronFrame
基于Haxe实现的基础Electron框架

## 安装Electron
```shell
sudo npm install electron -g
```
确保命令行可正常运行：
```shell
electron ./bin/ElectronSetup.js
```

## 可更新bin中的内容，将网页实现内容更新到bin中。
网页入口为index.html

## 调用本地命令
需要引入command.js文件：
```html
<script type="text/javascript" src="./command.js"></script>
```
调起命令：
```js
Command.cmd("echo 123",function(err,stdout,stderr){
    //返回执行结果
    trace(err,stdout,stderr);
});
```