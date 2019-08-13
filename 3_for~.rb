for i,j in [[1,2,3],[4,5,6]]
  p "i:#{i} j:#{j}"
  bar = j
end
puts "for式はスコープを作成しないため、参照可:#{bar}"

[2,3,4].each do |index|
  a = index
  p a
end
#puts a .eachはスコープを作成するので参照不可

#ハッシュ
 h = {:foo1 => 1, :foo2=>2, :foo3=>3}
 h = Hash[:foo1,1,:foo2,2,:foo3,3]
 p h[:foo1]

h2 = Hash.new(5) #デフォルト値を定めれば無いキーでもアクセスできる
p h2[:nofdaf]

def foo a, b, c
  return c
end

p foo(1,2, :foo1=>3, :foo2=>4) #:foo1=>3, :foo2=>4はひとつのHashオブジェクト。{}が省略されている。最後の引数のみ有効。

p (1..5).include?(5)
p (1...5).include?(5)
p (1..5)==3
p (1..5)===3

for i in "a".."z"
  p i
end

a = "abcdefg"
p a[1..3]
p a[1...3]

#case式では===が実行される -> Rangeクラスでは包含判定となる
case 7
when 1...5  then; p 1
when 6...10 then; p 2
end

#様々な書き方があるwhile
i = 0
while (0..4) === i do
  p i
  i += 1
end

i = 0
until i==5 do
  p i
  i +=1
end

begin
  p "begin"
end while false

#puts "無限ループ" while true

#正規表現
p "Ruby" === "I love Ruby"
p /Ruby/ === "I love Ruby"

p /Ruby/ =~ "I love Ruby"
p "I love Ruby" =~ /Ruby/ #=~はStringにも定義されている
p $& #=~と同じスコープで使える組み込み変数。その他いろいろ有り

puts "正規表現の後方参照"
"http://www.xyz.org/" =~ %r|(http://www)(\.)(.*)/|
p $1
p $2
p $3
p $4
#$0はRubyのスクリプト名。正規表現とは無関係
