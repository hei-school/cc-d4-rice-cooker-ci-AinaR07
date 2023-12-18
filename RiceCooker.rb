# frozen_string_literal: true

def afficher_menu
  puts 'Que souhaitez-vous faire?'
  puts '1. Cuire du riz'
  puts '2. Cuisson à la vapeur'
  puts '3. Cuisson des céréales'
  puts '4. Cuisson de la soupe'
  puts '5. Bouillir de l\'eau'
  puts '6. Cuisson du dessert'
  puts '7. Maintenir au chaud' 
  puts '8. Quitter'
end

def choisir_option
  print 'Choisissez une option : '
  choix = gets.chomp.to_i
  raise 'Option invalide. Veuillez choisir un nombre entre 1 et 8.' unless (1..8).include?(choix)

  choix
end

def attendre(msi)
  sleep(msi / 1000.0)
end

def cuire_riz
  puts 'Cuisson du riz en cours...'
  attendre(5000) # Attendre 5 secondes
  puts 'Le riz est cuit'
  attendre(5000) # Attendre 5 secondes
  puts 'Cuisson terminée'
end

def cuisson_vapeur
  puts 'Cuisson à la vapeur...'
  attendre(5000) # Attendre 5 secondes
  puts 'Veuillez Patientez SVP'
  attendre(5000) # Attendre 5 secondes
  puts 'Cuisson terminée'
end

def cuisson_cereales
  puts 'Cuisson des céréales...'
  attendre(5000) # Attendre 5 secondes
  puts 'Cuisson terminée'
  attendre(5000) # Attendre 5 secondes
  puts 'Ca y est c\'est prêt'
end

def cuisson_soupe
  puts 'Cuisson de la soupe...'
  attendre(5000) # Attendre 5 secondes
  puts 'Cuisson terminée'
  attendre(5000) # Attendre 5 secondes
  puts 'La soupe est prête'
end

def bouillir_eau
  puts 'Bouillir de l\'eau...'
  attendre(5000) # Attendre 5 secondes
  puts 'tic tic tic tic'
  attendre(5000) # Attendre 5 secondes
  puts 'L\'eau est chaude'
end

def cuisson_dessert
  puts 'Cuisson du dessert...'
  attendre(5000) # Attendre 5 secondes
  puts 'Cuisson terminée'
  attendre(5000) # Attendre 5 secondes
  puts 'C\'est prêt'
end

def maintenir_chaud
  puts 'Maintenir au chaud...'
  attendre(5000) # Attendre 5 secondes
end

def main
  loop do
    afficher_menu
    begin
      option = choisir_option
      case option
      when 1
        cuire_riz
      when 2
        cuisson_vapeur
      when 3
        cuisson_cereales
      when 4
        cuisson_soupe
      when 5
        bouillir_eau
      when 6
        cuisson_dessert
      when 7
        maintenir_chaud
      when 8
        puts 'Au revoir et bon appétit !!!'
        return
      end
    rescue StandardError => e
      puts e
    end
  end
end

main
