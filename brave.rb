require "./character.rb"

class Brave < Character
def attack(monster)
    puts "#{@name}の攻撃！"
    damage = @offense - monster.defense / 2
    puts "#{monster.name}に#{damage}のダメージを与えた！"
    
    monster.hp -= damage
    monster.hp = 0 if monster.hp < 0
  end
end