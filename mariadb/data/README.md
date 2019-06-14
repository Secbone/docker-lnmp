## mariadb 数据文件目录

因为目录权限问题，mysql 无法写文件，请将目录改为 `999:999`

```shell
sudo chown -R 999:999 socks
```

详情关注 [issue#3270](/docker/compose/issue/3270)
