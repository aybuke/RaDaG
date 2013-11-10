# encoding: utf-8

class Qmail

  def time_rand
    Time.at(rand * Time.now.to_i).nsec
  end

  def ip_rand
    ip = "%d.%d.%d.%d" % [rand(256), rand(256), rand(256), rand(256)]
    return ip
  end
  
  def port_rand
    port = Random.rand(1..1000)
    return port
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
end

obj3 = Qmail.new
puts obj3.time_rand()
puts obj3.ip_rand()
puts obj3.mail_rand()
puts obj3.fraction_rand()
puts obj3.port_rand()
