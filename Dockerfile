FROM rubylang/ruby

RUN gem install webrick

ADD ./min.rb /min.rb

EXPOSE 8000

CMD ["ruby", "min.rb"]
