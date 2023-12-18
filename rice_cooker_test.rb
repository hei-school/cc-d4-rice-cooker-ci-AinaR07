require 'minitest/autorun'
require_relative 'RiceCooker'

class RiceCookerTest < Minitest::Test
  def setup
    @RiceCooker = riceCooker.new
  end

  def test_cuire_riz
    assert_output(/Le riz est cuit.*Cuisson terminée/) { cuire_riz }
  end

  def test_cuisson_vapeur
    assert_output(/Veuillez Patientez SVP.*Cuisson terminée/) { cuisson_vapeur }
  end

  def test_cuisson_cereales
    assert_output(/Cuisson des céréales terminée.*Ca y est c'est prêt/) { cuisson_cereales }
  end

  def test_cuisson_soupe
    assert_output(/Cuisson terminée.*La soupe est prête/) { cuisson_soupe }
  end

  def test_bouillir_eau
    assert_output(/tic tic tic tic.*L'eau est chaude/) { bouillir_eau }
  end

  def test_cuisson_dessert
    assert_output(/Cuisson terminée.*C'est prêt/) { cuisson_dessert }
  end

  def test_maintenir_chaud
    assert_output(/Maintenir au chaud.../) { maintenir_chaud }
  end

  def test_choisir_option
    input = "3\n"
    assert_output(/Choisissez une option : /) { $stdin = StringIO.new(input); choisir_option }
  end
end
