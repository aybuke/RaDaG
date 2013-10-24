# encoding: utf-8

text_file=File.open('data.txt')
file = text_file.readlines()
text_file.close

i=0
first_line = file[0]
array1= Array.new
first_line.each_line(' '){
|s|
array1[i]=s
i=i+1
}

j=0
second_line = file[1]
array2= Array.new
second_line.each_line(' '){
|s|
array2[j]=s
j=j+1
}

array3=file[2]

how_many = array3.to_i
start=1
a=1
while start <= how_many
  print "\n", start,"\n"
    if array1[1].include? 'integer'
      while a<=array2[1].to_i
        int = Random.rand(0..999_999)
        print int,' '
        a = a+1
      end
    end
    a=1   
    if array1[2].include? 'char'
      while a<=array2[2].to_i
        o = [('a'..'z'),('A'..'Z')].map{|r| r.to_a}.flatten
        char = (0..1).map{ o[rand(o.length)].chr}.join
        print char,' '
        a=a+1
      end
    end
    a=1
    if array1[3].include? 'date'
      while a<=array2[3].to_i
        day=rand(30)
        mounth=rand(12)
        year=rand(1000..2500)
        date= day.to_s+"-"+mounth.to_s+"-"+year.to_s
        print date,' '
        a=a+1
      end
    end
    a=1
    if array1[4].include? 'email'
      while a<=array2[4].to_i
        o = [('a'..'z')].map{|r| r.to_a}.flatten
        string1 = (0..8).map{ o[rand(o.length)] }.join
        string2 = (0..8).map{ o[rand(o.length)] }.join
        mail = string1+"@"+string2+".com"
        print mail,' '
        a=a+1
      end
    end
    a=1
    start=start+1
end
