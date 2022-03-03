# 第7章 クラスの作成を理解する
〜ruby 3.0以降〜
伊藤 淳一. プロを目指す人のためのRuby入門［改訂2版］　言語仕様からテスト駆動開発・デバッグ技法まで (Software Design plus) (Japanese Edition) Kindle 版.

# レジュメ
| 章 | 内容 |
| -- | --- |
| 7.7 | メソッドの可視化 |
| 7.8 | 定数についてもっと詳しく |
| 7.9 | さまざまな種類の変数 |
| 7.10 | クラス定数やRubyの言語使用に関する高度な話題 |
| 7.11 | この章のまとめ |

# 7.7 メソッドの可視化
## irbに入った時の空間に関して
- irbで **`self`** を打つと何が表示される？つまり、インスタンス名は？
- irbで **`self.class`** を打つと何が表示される？つまり、クラス名は？
- irbやファイルにいきなり、 **`def method`** を書くと何クラスのインスタンスメソッドになる？
※ `private_instance_methods.include?()`
![継承メソッドチェーン](images/inheritance_of_method.JPG)


## インスタンスメソッドのpublic, private
- <span style="font-size: 28px; font-weight: bold; color: green;">public</span>
クラスの<u style="color: red;">外部に公開される</u>メソッド.
デフォルトでは、<u style="color: red;">initialize以外</u>

- <span style="font-size: 28px; font-weight: bold; color: orange;">protected</span>
そのメソッドを定義した<u style="color: red;">クラス自身と、そのサブクラスのインスタンスメソッドから</u>(レシーバ付き)で呼び出せるメソッド

- <span style="font-size: 28px; font-weight: bold; color: red;">private</span>
クラスの<u style="color: red;">外部に公開されない</u>メソッド(旧バージョンはレシーバ付では呼び出せなかった)

### 問題:インスタンスメソッドの可視性（public, private)
<span style="color: red;">privateメソッドは継承される</span>(例：what_method)
※ `private_instance_methods.include?()`
user.rb
以下のメソッドを外部から呼び出すことはできますか？
1. User#greet
2. User#initialize
3. User#get_age

```ruby
class User
  def greet
    "私は、#{@name}です。よろしくお願いします。"
  end

  public
  def initialize(name:, age:, weight:)
    @name, @age, @weight = name, age, weight
  end

private
  def get_age
    @age
  end
end
```
### 可視性の変更方法
- 一緒に定義
```ruby
class User
  def foo = ‘hoge’ #=> :foo
  def bar = ‘bage’ #=> :bar

  private :foo, :bar
end
```
<small>endレスメソッド定義. (p.208). Kindle 版. </small>

- 一気に定義
```ruby
class User
  private def foo
    ‘hoge’
  end
  # メソッド定義は式になっているので（=を使わないとしても）メソッド名をシンボルで返す
end
```
### インスタンス変数のset, getメソッドのおさらい(attr_accessor)
- メソッド定義
```ruby
class User
  def initialize(name)
    @name = name
  end
  def name = @name
  def name=(value)
    @name = value
  end
end
```
- 一気に定義
```ruby
class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end
```
**可視性を変更するときは**

- 一緒に定義
```ruby
class User
  attr_accessor :name
  private :name, :name=

  def initialize(name)
    @name =name
  end
end

```
- 一気に定義
```ruby
class User
  private attr_accessor :name

 def initialize(name)
    @name =name
  end
end
```

### インスタンスのprotectedメソッド
user.rb
**体重は他人に公開したくない!**
**でも、体重を他人と比較はしたい**
```ruby
class User
  def initialize(name, weight)
    @name, @weight = name, weight
  end

def heavier_than?(other)
    other.weight < @weight # X
  end
end
```
<small style="color: red;">weightメソッドを定義していないから呼び出せない!</small>

```ruby
class User
  protected attr_reader :weight
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
  def heavier_than?(other)
    other.weight < @weight
  end
end
```
<small>外部からはUser#weightは呼び出せない</small>

## クラスメソッドのpublic, private
### 問題（classメソッドの可視)
user.rb
以下のメソッドを外部から呼び出すことはできますか？
1. User.counter_0
1. User.counter_1
1. User.counter_2

```ruby
class User
  @@count = 0
  def initialize(name:, age:, weight:)
    @name, @age, @weight = name, age, weight
    @@count += 1
  end

  def self.counter_0 = @@count
  private_class_method :counter_0

  class << self
    private
    def counter_1 = @@count
  end

  private
  def self.counter_2 = @@count
end
```

## モンキーパッチ
### 問題: 意図しないオーバーライド
- User#get_ageはprivateメソッドでした。Userを継承したAdmin#get_ageはprivate?
admin
```ruby
class Admin < User
  def get_age = "age: #{@age}"
end
```
- このコードに問題はありますか？
array
```ruby
class Array
  def replace(original, replacement)
    map{|e| e == original ? replacement : e}
  end
end
```
継承でのメソッド定義やモンキーパッチは、
継承先やそのクラスのメソッドを把握した上で行いましょう

## 今回のポイント
- <span style="font-size: 20px; color: red;">privateメソッドは継承される(逆説的に呼び出せない言語もある!)</span>
- <span style="font-size: 20px; color: red;">クラスメソッドの可視化変更方法はインスタンスメソッドとは異なる(privateの下に定義してもprivateにはならない!)</span>
- <span style="font-size: 20px; color: red;">戻り値が何かを意識する(メソッド定義はメソッド名のシンボル、定数・変数代入はその値)</span>
- <span style="font-size: 20px; color: red;">意図せぬオーバーライドに注意!</span>

# 7.8. 定数
## 定数とfreeze
### 問題: 定数とfreeze①
```ruby
MONEY_0 = [10, 50, 100, 500, 1000]
```
上記のコードがあるとして、以下のコードを実行するとどうなりますか？
```ruby
MONEY_0 = [10, 50, 100, 500, 1000] # 再定義しています
MONEY_0.map!(&:next)
MONEY_0 = [1, 5, 10, 50, 100]
MONEY_0.freeze
MONEY_0 = [10, 50, 100, 500, 1000]
MONEY_0.freeze.map!(&:next) # nextは次のオブジェクトを返す
```
- 定数とfreeze②
```ruby
MONEY_S = %w[10 50 100 500 1000].freeze
```
上記のコードがあるとして、以下のコードを実行するとどうなりますか？
```ruby
MONEY_S.map{|money| money << "00" }
```
### 定数のレキシカルスコープ
ファイルを実行すると何が出力されるでしょう？


## 今回のポイント
- <span style="font-size: 20px; color: red;">定数なのに再代入できちゃう!</span>
- <span style="font-size: 20px; color: red;">メソッドの中で、定数に代入はできない</span>
- <span style="font-size: 20px; color: red;"></span>
- <span style="font-size: 20px; color: red;"></span>
