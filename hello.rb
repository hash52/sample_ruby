

class Stack
  def initialize
    @data = []
  end

  def push(x)
    @data.push(x)
  end

  def pop
    @data.pop
  end
end

s = Stack.new
s.push(1)
s.pop

#例外処理
begin
  1/0
rescue ZeroDivisionError => e
  p e #オブジェクトの出力は p
ensure
  puts"finally的なもの"
end

#演習問題2
class Pet
  @name
  def initialize(name)
    @name = name
  end
end

dog = Pet.new("ぽち")
cat = Pet.new("たま")
p dog
p cat

a = 100

(1..10).each{|x| puts x + a} #eachメソッドに処理を渡しているのがポイント。
#繰り返せるのもにはeachメソッドがあり、それには処理(ブロック)を渡せる。というのがRubyの言語仕様！！
#ブロックはaを参照できる　≒クロージャオブジェクト化もできる。

(5..1).each{|x| puts x}


class Car
  def accele
    puts("accele!")
  end
end

class Formula < Car
  def accele
    puts("めっちゃ早い")
  end
end

module Wing
  def fly
    puts "飛んだ"
  end
end

class SuperCar < Car
  include Wing
end



car = Car.new
car.accele

f = Formula.new
f.accele

SuperCar.new.fly


#ダックタイピング
class Duck
  def sound
    puts"がーがー"
  end
end

class Cat
  def sound
    puts"みゃー"
  end
end

def call(something)
  puts something.sound
end

call(Duck.new)
call(Cat.new)

=begin


puts("hello world")

a = 1
if(a==1) then
  puts "1"
elsif(a<0) then
  puts "1より小さい"
else
  puts "1より大きい"
end

num = 7
if(num == 7)
  puts"7ちょうど♡"
elsif(num < 7)    elseif じゃなくて elsif
 puts"7より小さい"
else
  puts"7より大きい"
end


list = [1,2,3,4,5]

for number in list do
  puts number
end


counter = 10
until counter < 1 do
   puts(counter)
   counter=counter -= 1
end



#演習問題
for num in 5..1 do
  puts num
end

def greet(name)
  puts "Hello,#{name}"
end


__END__ #こっからコメント



・elseif じゃなくて elsif
・キーワード引数
def greet2(word: ,name:)
  puts "#{word},#{name}"
end

greet("Ruby")
greet2("Hello","Ruby")
#greet2(name:"Ruby",word:"こんにちは")
=end
