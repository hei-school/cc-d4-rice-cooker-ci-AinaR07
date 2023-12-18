import * as readline from 'readline'

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

function afficherMenu (): void {
  console.log('X--------X-------X')
  console.log('Que souhaitez-vous faire?')
  console.log('X--------X-------X')
  console.log('1. Cuire du riz')
  console.log('2. Cuisson à la vapeur')
  console.log('3. Cuisson des céréales')
  console.log('4. Cuisson de la soupe')
  console.log('5. Bouillir de l\'eau')
  console.log('6. Cuisson du dessert')
  console.log('7. Maintenir au chaud')
  console.log('8. Quitter')
}

async function choisirOption (): Promise<number> {
  return await new Promise((resolve, reject) => {
    rl.question('Choisissez une option : ', (choix) => {
      const option = parseInt(choix, 10)
      if (isNaN(option) || option < 1 || option > 8) {
        reject(new Error('Option invalide. Veuillez choisir un nombre entre 1 et 8.'))
      } else {
        resolve(option)
      }
    })
  })
}

async function main (): Promise<void> {
  let option: number
  while (true) {
    afficherMenu()
    try {
      option = await choisirOption()
      switch (option) {
        case 1:
          console.log('Cuisson du riz en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Le riz est cuit')
          await attendre(5000) // Attendre 5 secondes
          console.log('Cuisson terminée')
          break
        case 2:
          console.log('Cuisson à la vapeur en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Cuisson à la vapeur terminée')
          break
        case 3:
          console.log('Cuisson des céréales en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Cuisson des céréales terminée')
          break
        case 4:
          console.log('Cuisson de la soupe en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Cuisson de la soupe terminée')
          break
        case 5:
          console.log('Bouillir de l\'eau en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Eau bouillie')
          break
        case 6:
          console.log('Cuisson du dessert en cours...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Cuisson du dessert terminée')
          break
        case 7:
          console.log('Maintenir au chaud...')
          await attendre(5000) // Attendre 5 secondes
          console.log('Plat maintenu au chaud')
          break
        case 8:
          console.log('Au revoir et bon appétit !!!')
          rl.close()
          return
        default:
          console.log('Option non reconnue')
          break
      }
    } catch (error) {
      console.log(error.message)
    }
  }
}

async function attendre (ms: number): Promise<void> {
  await new Promise<void>((resolve) => setTimeout(resolve, ms))
}

(async () => {
  await main()
})()