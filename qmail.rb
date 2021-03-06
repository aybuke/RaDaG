# encoding: utf-8
require 'optparse'

class Parts
# generated random time.format: '973492011' 
  def time_rand1
    Time.at(rand * Time.now.to_i).nsec
  end

#generated random time.format: '1972-09-01 03:22:52 +0300'
  def time_rand2
    Time.at(rand * Time.now.to_i)
  end

#generated random ip.format:'115.232.14.162'
  def ip_rand
    ip = "%d.%d.%d.%d" % [rand(256), rand(256), rand(256), rand(256)]
    return ip
  end

#generated random port number.format: '50'
  def port_rand
    port = Random.rand(1..1000)
    return port
  end

#generated random proccess id.format: '28065'
  def pid_rand
    pid = Random.rand(1000..65535)
    return pid
  end

#generated random e-mail.format: 'jyevbjseh@lkqpmckry.com'
  def mail_rand
    o =  [('a'..'z')].map{|r| r.to_a}.flatten
    string1 = (0..8).map{ o[rand(o.length)]  }.join
    string2 = (0..8).map{ o[rand(o.length)]  }.join
    mail = string1+"@"+string2+".com"
    return mail
  end

#generated random word.format: 'yszmokxzc'
  def word_rand
    o =  [('a'..'z')].map{|r| r.to_a}.flatten
    word = (0..8).map{ o[rand(o.length)]  }.join
    return word
  end
  
#generated random fraction number.format: '36/51' 
  def fraction_rand
    i = Random.rand(0..100)
    j = Random.rand(0..100)
    if i<j
      fraction= "%d" %i + "/" + "%d" %j
      return fraction
    else
      return fraction_rand
    end
  end

#generated random number. format: '7368'
  def number_rand
    k = Random.rand(0..9999)
    return k
  end
end

class Qmail_Log < Parts
#format: 'TIMESTAMP rblsmtpd: 1.2.3.4 pid 27730: 451 message'
  def rblsmtpd(number)
    i=0
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} rblsmtpd: #{obj.ip_rand()} pid #{obj.pid_rand()}: #{obj.number_rand()} Send mail to #{obj.word_rand()} #{obj.mail_rand()} #{time_rand2()}"
    i=i+1
    end
  end

#format: 'TIMESTAMP tcpserver: status 3/50'  
  def tcpserver1(number)
    i=0
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} tcpserver: status: #{obj.fraction_rand()}"
      i=i+1
    end
  end
  
#format: 'TIMESTAMP tcpserver: pid 27730 from 1.2.3.4'
  def tcpserver2(number)
    i=0
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} tcpserver: pid #{obj.pid_rand()} from #{obj.ip_rand()}"
      i=i+1
    end
  end
 
#format: 'TIMESTAMP tcpserver: ok 27730 myhostname:myip:myport hostname:ip:ident:port'
  def tcpserver3(number)
    i=0
    array = ['ok', 'deny']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} tcpserver: #{array.sample} #{obj.word_rand()}:#{obj.ip_rand()}:#{obj.port_rand()} #{obj.word_rand()}:#{obj.ip_rand()}:#{obj.port_rand()}"
      i=i+1
    end
  end

#format: 'TIMESTAMP info msg 12345: bytes 3189 from <sender@domain.xyz> qp 27763 uid 46'
  def qmail_send(number)
    i=0
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} info msg #{obj.number_rand()}: bytes #{obj.number_rand()} from <#{obj.mail_rand()}> qp #{obj.number_rand()} uid #{obj.number_rand()}"
      i=i+1
    end
  end
  
#format: 'TIMESTAMP jgreylist[27730]: 1.2.3.4 DENY no reverse DNS'
  def jgreylist(number)
    i=0
    array = ['OK known', 'DENY no reverse DNS', 'GREY first time', 'GREY too soon']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} jgreylist[#{obj.number_rand()}]: #{obj.ip_rand()} #{array.sample}"
      i=i+1
    end
  end
  
#format: 'TIMESTAMP qmail-smtpd[12345]: Received-SPF: unknown (myhostname: ...)'
  def spf(number)
    i=0
    array = ['pass', 'none', 'unknown', 'neutral', 'softfail', 'fail', 'error']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} qmail-smtpd[[#{obj.number_rand()}]: Received-SPF: #{array.sample} #{obj.word_rand()}:#{obj.ip_rand()}:#{obj.port_rand()}"
      i=i+1
    end
  end
  
#format: 'TIMESTAMP qmail-smtpd[12345]: before greeting: [1.2.3.4] client disconnected'
  def greetdelay(number)
    i=0
    array = ['disconnected', 'sent data']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} qmail-smtpd[[#{obj.number_rand()}]: before greeting: [#{obj.ip_rand()}] client #{array.sample}"
      i=i+1 
    end
  end

#format: 'TIMESTAMP qmail-smtpd[12345]: AUTH successful [1.2.3.4] user@domain.xyz'
  def auth(number)
    i=0
    array=['failed','successful']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} qmail-smtpd[[#{obj.number_rand()}]: AUTH #{array.sample} [#{obj.ip_rand()}] <#{obj.mail_rand()}>"
      i=i+1
    end
  end

#format: 'TIMESTAMP qmail-smtpd[12345]: MAIL FROM:<email@domain.xyz>'
  def mailrcpt(number)
   i=0
    array=['MAIL FROM', 'RCPT TO']
    while i<number
      obj = Parts.new
      puts "@#{obj.time_rand1()} qmail-smtpd[[#{obj.number_rand()}] #{array.sample} <#{obj.mail_rand()}>"
      i=i+1
    end
  end 
end

options = {:file => nil}
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: script.rb [options] [options] file"

  opts.on('-f', '--file') do |file|
    options[:file] = file
  end
end
optparse.parse!

if options[:file]
  exec("ruby qmail.rb > log.txt")
end


obj = Qmail_Log.new
obj.rblsmtpd(2)
#obj.tcpserver1(2)
#obj.qmail_send(2)
#obj.tcpserver2(2)
#obj.tcpserver3(3)
#obj.jgreylist(1)
#obj.spf(4)
#obj.greetdelay(1)
#obj.auth(2)
#obj.mailrcpt(1)

