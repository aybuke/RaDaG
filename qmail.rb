# encoding: utf-8

class Parts

  def time_rand1
    Time.at(rand * Time.now.to_i).nsec
  end
  
  def time_rand2
    Time.at(rand * Time.now.to_i)
  end

  def ip_rand
    ip = "%d.%d.%d.%d" % [rand(256), rand(256), rand(256), rand(256)]
    return ip
  end
  
  def port_rand
    port = Random.rand(1..1000)
    return port
  end
  
  def pid_rand
    pid = Random.rand(1000..65535)
    return pid
  end
  def mail_rand
    o =  [('a'..'z')].map{|r| r.to_a}.flatten
    string1 = (0..8).map{ o[rand(o.length)]  }.join
    string2 = (0..8).map{ o[rand(o.length)]  }.join
    mail = string1+"@"+string2+".com"
    return mail
  end

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
  
  def number_rand
    k = Random.rand(0..9999)
    return k
  end
end

class Qmail_Log < Parts
  def Combine_Parts(number)
  i=0
    while i<number
      obj3 = Parts.new
      puts "@#{obj3.time_rand1()} rblsmtpd: #{obj3.ip_rand()} pid #{obj3.pid_rand()}: #{obj3.number_rand()} Send mail to honeynet #{obj3.mail_rand()} #{time_rand2()}"
    i=i+1
    end
  end
end

obj = Qmail_Log.new
#obj3 = Parts.new
#puts obj3.time_rand()
#puts obj3.ip_rand()
#puts obj3.mail_rand()
#puts obj3.fraction_rand()
#puts obj3.port_rand()
#puts obj3.pid_rand()
obj.Combine_Parts(2)
