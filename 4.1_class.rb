class Foo
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end

module Bar
  def methodA
    111
  end
end

foo1 = Foo.new(1)
def foo1.method2 #特異メソッド。インスタンスにメソッドを定義
  @a + 100
end
p foo1.method2
foo2 = Foo.new(2)
#p foo2.method2 不可
singleton_class = class << foo1
  self
end
p singleton_class

class << foo1
  include Bar
end

foo1.extend(Bar) #こっちのほうが簡潔にかける

p foo1.methodA

#foo2.methodA 不可
