docker新新新新手
记录自己docker研究：
使用docker-compose
部署nginx mysql redis sidekiq memcache elasticsearch 以及两个puma负载 等7个容器


有关rails具体项目内容文件   略

主要内容是
1 dockerfile
2 docker-compose.yml
3 链接服务配置对应docker的变动：
 config/initializers/sidekiq.rb
 config/sidekiq.yml
 config/redis.yml
 config/initializers/rucaptcha.rb
等
4 记录常用docker命令文件 docker_readme

问题：
使用镜像ruby2.5.0 install ffmpeg build-essential 慢，换清华的源加速后有依赖报错 未果，只能等着 要build一两个小时(悲伤)
无奈的选择：
将ruby镜像上传docker hub 后续直接拉取

docker hub 地址：
https://hub.docker.com/u/gh12128/

有关链接：
https://yeasy.gitbooks.io/docker_practice/introduction/
https://yeasy.gitbooks.io/docker_practice/install/mirror.html
http://www.runoob.com/docker/docker-install-mysql.html
http://www.runoob.com/docker/docker-architecture.html
https://reinteractive.com/posts/359-docker-for-rails-development
https://hub.docker.com/r/gh12128/
https://cloud.docker.com/swarm/gh12128/repository/list
https://ruby-china.org/topics/32459
https://ruby-china.org/topics/30098
https://github.com/docker/compose
https://github.com/docker/docker.github.io/blob/master/compose/compose-file/index.md
https://github.com/opf/openproject/blob/dev/Dockerfile
https://blog.csdn.net/zhiaini06/article/details/45287663
https://blog.csdn.net/pushiqiang/article/details/78682323
https://nickjanetakis.com/blog/dockerize-a-rails-5-postgres-redis-sidekiq-action-cable-app-with-docker-compose
