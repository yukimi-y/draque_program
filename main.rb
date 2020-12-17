class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    damage = (@offense - monster.defense) / 2
    monster.hp -= damage

    monster.hp = 0 if monster.hp < 0

    puts "#{@name}の攻撃！"
    puts "#{monster.name}に#{damage}のダメージを与えた！"
  end
end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(brave)
    puts "#{@name}の攻撃！"
    damage = @offense - brave.defense
    brave.hp -= damage

    brave.hp = 0 if brave.hp < 0
    puts "#{brave.name}は#{damage}のダメージを受けた！"
    puts "*=*=*=*=*=*=*=*=*=*=*"
    puts "【#{brave.name}】HP:#{brave.hp}"
    puts "【#{@name}】HP:#{@hp}"
    puts "*=*=*=*=*=*=*=*=*=*=*"
  end

end

brave = Brave.new(name: "ゆうしゃ", hp: 238, offense: 203, defense: 129)
monster = Monster.new(name: "アークデーモン", hp: 210, offense: 140, defense: 80)

brave.attack(monster)
monster.attack(brave)


loop do
  brave.attack(monster)
  break if monster.hp <= 0

  monster.attack(brave)
  break if brave.hp <= 0
end