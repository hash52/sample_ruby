#変数のスコープ
Constanse = 1
#Constanse = 2 定数のためエラー

foo = 1
def bar
  foo #メソッドから外部のローカル変数の参照は不可。メソッド呼び出しとみなされる
end
#bar　#エラー
#baz2 #代入文がないためエラー

$foo = 1
def bar2
  $foo
end
p bar2
p $baz2 #未初期化時のグローバル変数はnil

#リテラル
p 3e2 #10の2乗
p 3e-2 #10の-2乗

#0b2 #2進数ではないのでエラー

p 100_000_000 #_を無視する

p ?R
p ?\C-v
p ?\n #文字コード

#UFO演算子
p 100 <=> 10
p 100 <=> 100
p 10 <=> 100

a = 200
p a **= 2 #a=a**2を

def add a, b, c=100
  a+b+c
end

p add 1,2
# add 1 #引数が足りないとエラー


#if式
if true then #thenは省略可
  p 1
end
a = if true
  2
end

p a

a = 3 if true
p a
a = 4 if false
p a

#文字列
s = "ab" 'cd' #スペースで区切ると連結
p s

s = 100_000_000
p "a is #{s}" #""は式展開可
p 'a is #{s}' #''は不可

p '12ab3'.to_f

p "\\"
p '\x'

p "a\nb"
print "c\nd"
puts "e\nf"
puts "g\nh"

# ヒアドキュメント
query = <<SQL
  select *
   from my_table;
SQL

puts query

def foo
  #識別子の前にはスペースなどの文字不可。-を入れることで解決
  <<-RESULT
    Ru
    by
  RESULT
end

p foo

s = <<TEST
  #{foo}
TEST
p s

#シングルクォーテーションで式展開無効
s = <<'TEST'
  #{foo}
TEST
p s

#パーセント記法
p %*"test#{foo}"* #数値、アルファベット以外の文字が使用可
p %q*#{foo}* #%qとすることでシングルクォートのように式展開が無効になる
p %r** #正規表現

#文字列演算
a = "ru" + "by"
p a*3 #3*aはエラー
p a

b = "r"
p b << "uby2"
p b

p "日本語".length #lengthはバイト長を参照するため、日本語などのマルチバイト文字の場合、期待した結果にならないことがあるので注意

p "result: %05.2f" % 1.11111111 #文字列の%演算子はsprintfと同じ意味

#シンボル
v1 = "foo1"
v2 = v1.to_sym
p v2
p v2.to_s

p "foo1".object_id
p "foo1".object_id

p :foo1.object_id
p :foo1.object_id
p :foo2.object_id

p "foo1"=="foo1"
p "foo1".equal? "foo1" #オブジェクトが同一かどうか
p :foo1 == :foo1
p :foo1.equal? :foo1

v2 = v1
v1.equal? v2
