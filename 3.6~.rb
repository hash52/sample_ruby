#array
a1 = [[1,2],[3,4]]
p "a1:#{a1[1][1]}"

a2 = %w(hoge hoo bar)
p a2.join("_")

a3 = Array.new(5)
p a3.length

p Array.new(2){|index| index + 10}

a4 = Array.new(5 ,"a") #代２引数で要素を指定した場合は全て同一オブジェクト
p a4
a4[3].replace("b")
p a4

a4 = Array.new(5){"a"}
a4[3].replace("b")
p a4

a5 = [10]
p a5.length
a5[4] = "aa"
p a5.length
p a5

#添字演算子
a6 = Array.new(5){|index| index}
p "length:#{a6.length}"
p a6
p a6[-1] #length-1が実際のインデックス
p a6[5-2]
p a6[-5] #length-5が実際のインデックス
p a6[5-5]
p a6[2,2]
p a6[2,10] #あるところまでできる。エラーじゃない

a6[0,2] = "a"
p a6
a6[0,2] = ["aa","bb"]
p a6
a6[0,2] = "aa","bb","cc","dd","ee" #右辺の[]省略可
p a6

#多重代入
def foo
  return 1,2,3
end

a, b, c = foo
p %w(a b c)

a, b, c = 1,2
p c

a, b, *c = 1,2,3,4,5,6
p "what is a=#{a} b=#{b} c=#{c}"

def bar a, *b
  return b
end

p bar(1,2,3,4,5)

#配列の演算
a = [1,1,2,2]
b = [2,2,3,4]
p "&:#{a & b}"
p "|:#{a | b}"
p "+:#{a + b}"
p "-:#{a - b}"#aから2,3,4が取り除かれる
p "*3:#{a * 3}"
p "*_:#{a * "_"}"
