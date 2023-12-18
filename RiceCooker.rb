# frozen_string_literal: true

# Simulates the functionality of a rice cooker with various cooking options.
class RiceCooker
  def initialize
    @cooked_rice = false
  end

  def cook_item(ingredient, success_message)
    puts "Ajout de #{ingredient}..."
    delay(1000)
    beep
    puts "#{success_message} terminée !"
    true
  rescue StandardError => e
    puts "Une erreur s'est produite lors de la cuisson de #{ingredient}: #{e.message}"
    false
  end

  def cook_rice
    cook_item('du riz', 'Cuisson du riz')
  end

  def keep_warm
    cook_item('de la nourriture', 'Maintien au chaud de la nourriture')
  end

  def steam_cook
    cook_item('de la nourriture pour la cuisson à la vapeur', 'Cuisson à la vapeur')
  end

  def cook_soup
    cook_item("de l'eau", 'Cuisson de la soupe')
  end

  def cook_dessert
    cook_item('des ingrédients pour le dessert', 'Cuisson du dessert')
  end

  def beep
    puts 'BEEP BEEP BEEP - Cuisson terminée !'
  end

  def start
    loop do
      display_options
      choice = user_choice

      handle_choice(choice)
      break if choice == 6
    end
  end

  private

  def display_options
    puts "\nQue souhaitez-vous faire ?"
    puts '1. Cuire du riz'
    puts '2. Maintenir au chaud'
    puts '3. Cuisson à la vapeur'
    puts '4. Cuisson de la soupe'
    puts '5. Cuisson du dessert'
    puts '6. Quitter'
    print 'Choisissez une option : '
  end

  def user_choice
    input = gets.chomp
    input.to_i.zero? && input != '0' ? 0 : input.to_i
  end

  def handle_choice(choice)
    case choice
    when 1 then cook_rice
    when 2 then keep_warm
    when 3 then steam_cook
    when 4 then cook_soup
    when 5 then cook_dessert
    when 6 then quit
    else invalid_choice
    end
  end

  def quit
    puts 'Au revoir !'
  end

  def invalid_choice
    puts 'Choix non valide. Veuillez choisir une option valide'
  end

  def delay(milliseconds)
    sleep(milliseconds / 1000.0)
  end
end

if __FILE__ == $PROGRAM_NAME
  rice_cooker = RiceCooker.new
  rice_cooker.start
end
