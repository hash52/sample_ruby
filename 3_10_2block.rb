def func a
  a + yield
end
x = 2

p "func:#{func(3){x += 1}}" #yieldはブロックを参照する
p "x:#{x}" #ブロックはすでにある変数を書き換えることが出来る

#ブロックには引数を与えることが出来る
def func2 a,b
  return a + yield(b, 3) if block_given? #ブロックの有無の判定
  a + b
end
p func2(1,2){|x, y| x + y}
p func2(1,2)

#ブロックのオブジェクト化
proc = Proc.new{|x| p "proc called args=#{x}"}
proc.call(3)

def get_counter start
  Proc.new{|up| start += up} #処理自体を生成して遅延評価できる
end

count_up = get_counter(1)
count_up.call(2)
count_up.call(3)

#Procとブロックの変換
proc = Proc.new{|x, y| (x + y)*100}
p func2(5, 10 ,&proc) #ブロックとして渡す

def func3 x, &proc
  x + proc.call #Procとして受け取る
end

func3(1) do
  2
end

#lambaとproc
def procFunc
  proc = Proc.new{return 1}
  proc.call #処理終了
  2
end

def lambdaFunc
  lam = lambda{return 1}
  lam.call #呼び出し元に返る
  2
end

p "procFunc:#{procFunc}"
p "lambaFunc:#{lambdaFunc}"

#raise ArgumentError, "引数が不正です"
#raise "なんとなくエラー出してみた"

begin
  p 1
rescue
  p 0
else
  p 2
ensure
  p 3
end

# => で例外オブジェクトを扱える
begin
  1/0
rescue ZeroDivisionError => e
  p e.backtrace
end

begin
  1/0
rescue ZeroDivisionError
  p $!.class
#  raise 最後に発生した例外を再度発生させることが出来る
end

a = 0
begin
  p "begin"
  b = 1/a
rescue ZeroDivisionError
  a +=1
  retry
ensure
  p "ensure:#{b}"
end

#catchがbegin節に相当し、throwがraiseに相当する
#正常時であっても処理を抜けたい時に使う
def foo
  throw :exit1 #throwが実行されると同名のラベルが指定されているcatchまでスタックを辿り、あればそのブロック内の後の処理をスキップしてブロックを抜ける(なければNameError)
end

catch(:exit1){
  foo
  p 1 #実行されない
}
p 2
