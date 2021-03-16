## Dockerを起動する

```
$ docker pull rubylang/ruby

$ docker build -t druby/min .

$ docker run -it --rum -p 8000:8000 druby/min
```

### IRB_client
```
$ docker build -t druby/irb_c .

$ docker run -it --rm druby/irb_c druby://172.17.0.2:54345
```

## Driq

DriqのSSE版WEBrickを起動する
```
$ ruby vendor/bundle/ruby/2.7.0/gems/driq-0.4.2/lib/driq/webrick.rb
```
