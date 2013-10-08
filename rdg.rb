# encoding: utf-8

class RaDaG

  def getRandomint
      i = Random.rand(0..999_999)
    return i
  end

  def getRandomChar
    o =  [('a'..'z'),('A'..'Z')].map{|r| r.to_a}.flatten
    char  =  (0..1).map{ o[rand(o.length)].chr}.join
    return char
  end

  def getRandomDate
    day=rand(30)
    mounth=rand(12)
    year=rand(1000..2500)
    date= day.to_s+"-"+mounth.to_s+"-"+year.to_s
    return date
  end

  def getRandomMail
    o =  [('a'..'z')].map{|r| r.to_a}.flatten
    string1 = (0..8).map{ o[rand(o.length)]  }.join
    string2 = (0..8).map{ o[rand(o.length)]  }.join
    mail = string1+"@"+string2+".com"
    return mail
  end
    
end


obj4 = RaDaG.new
puts obj4.getRandomMail()
obj3 = RaDaG.new
puts obj3.getRandomDate()
obj2 = RaDaG.new
puts obj2.getRandomChar()
obj = RaDaG.new
puts obj.getRandomint()
