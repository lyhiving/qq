QQ Connect SDK for Ruby Framework
================
[![Gem Version](https://badge.fury.io/rb/qq_conn@2x.png)](https://badge.fury.io/rb/qq_conn)

### 安装:

在你的Gemfile里新增一行

`gem 'qq_conn'`

然后

`bundle install`

最后

`require 'qq'`
### 完整示例:
1. 在 [QQ互联开放平台](https://connect.qq.com/) 申请 APP_ID 和 APP_KEY,并设置网站地址和回调域.
2. 下载 demo 文件夹.
3. 修改 `qq_secrets.yml` 中的参数,应与上一步的参数保持一致.
4. 修改 `index.rb` 中绑定的域名.
5. `bundle exec ruby index.rb`.

相关参数请查阅[QQ互联开放平台](http://connect.qq.com/intro/login/)

#### 在Rails中使用
默认读取的是当前工作目录下的`qq_secrets.yml`，可通过更改当前工作目录的方式，读取其他位置的配置文件
```
Dir.chdir(Rails.root+'config')
require 'qq'
```
以上代码是读取**Rails**项目**config**下的`qq_secrets.yml`配置文件

### 授权:

MIT
