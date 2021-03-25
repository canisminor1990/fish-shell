#  Vi/Vim 基本操作:
 
- 在默认的"指令模式"下按 i 进入编辑模式
- 在非指令模式下按 ESC 返回指令模式
- 在"指令模式"下输入:

```shell
:w #保存当前文件
:q #退出编辑,如果文件为保存需要用强制模式
:q! #强制退出不保存修改
:wq #组合指令, 保存并退出
```

- 在"指令模式"下移动:

```shell
h #左 
j #下 
k #上 
l #右
```
 
### 翻页

```shell
Shift + f(front) #下一页
Shift + b(back) #上一页
```
 
### need more?

简明VIM练级攻略 <http://coolshell.cn/articles/5426.html>

在线教程+Web版VIM <http://www.openvim.com/index.html>

# Terminal基本指令

### 权限相关

```shell
sudo
# 提升当前操作权限

passwd [username]
# 修改用户密码, 一般用来激活root用户

chown [target][user]
# 修改制定目标的拥有者

chmod 755 [command]
# 提高指定文件的执行权限

chown/chmod
# 这两个指令没有深究过
```
 
### 查看/帮助

```shell
man[command]
# 查看指令的帮助,一般使用vim打开txt帮助文件,按q退出(重点)

cat [file name]
# 输出指定文件的内容

which  [command]
# 查看指令的位置: which ruby 这样可以检查环境
```
 
### 基本文件操作

```shell
ls -a  [path]
# 查看当前目录下所有文件, 包括隐藏文件

ls -l[path]
# 查看文件的完整信息,包括拥有者,读写权限

rm -rf [path]
# 删除文件夹

mv [source path] [target]
# 移动文件/重命名

cp  [source path] [target]
# 复制文件
```
 
## Terminal中实用工具

```shell
tail -f$CATALINA_HOME/logs/catalina.out
# 查看tomcat日志

tree -L 3 .
# 用树状结构查看目录, -L制定查看深度

grep 
# 正则表达式工具,可以用来过滤结果

ls -a | grep .ba
# 可以找到包含ba的隐藏文件, 有时候用来找 .bash_profile文件

svn st | grep ^?
# 查看当前办本库中未添加的文件

ping -c 3 10.2.1.18ping 
# 3次指定目标,不指定次数会一直ping下去,这点和windows不一样
```

### Terminal操作技巧

```shell
Ctrl + a #光标移动到行首
Ctrl + e #光标移动到行尾
Double Tab #可以列出代选命令/代选文件
Ctrl + c #强制推出当前操作
```
 
#### Mac OS 下

```shell
Command + K #清屏
Command + T #新建标签
Command + {} #向左/向右切换标签
```
 
#### 使~/.bash_profile立即生效的方式

```shell
source .bash_profile(用过这个方法)
```
 
 
## 进程操作:

```shell
ps -A | grep [process name regex] 
# 查看制定进程

e.g: ps -A | grep eclipse 
# 查看eclipse进程
 
kill [PID] 
# 强制kill掉制定进程
 
sudo lsof -i -P | grep 9092
# 查看指定端口的PID, 非常有用
 
update[2014-03-17]:
 
lsof -i:8080 
# 这个速度更快
```
 
## SSH操作:

```shell
ssh lvjian@192.168.1.6    
# server端需要架设OpenSSH服务器
 
scp ./lib/*.jar lvjian@192.168.1.6:jeespace/biandan/war/WEB-INF/lib      
# 向SSH Server远程copy文件
```