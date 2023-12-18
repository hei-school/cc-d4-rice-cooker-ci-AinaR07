import { afficherMenu, choisirOption, main, attendre } from 'RiceCooker.ts'; 

jest.mock('readline', () => ({
  createInterface: jest.fn(() => ({
    question: jest.fn((questionText: string, cb: (answer: string) => void) => {
      if (questionText === 'Choisissez une option : ') {
        cb('1'); // Simuler l'entrée utilisateur pour le test de choisirOption
      }
    }),
    close: jest.fn(),
  })),
}));

describe('Testing RiceCooker functionalities', () => {
  afterEach(() => {
    jest.clearAllMocks();
  });

  test('afficherMenu should display the menu', () => {
    const spyLog = jest.spyOn(console, 'log').mockImplementation(() => {});
    afficherMenu();
    expect(spyLog).toHaveBeenCalledTimes(8); 
    spyLog.mockRestore();
  });

  test('choisirOption should return the chosen option', async () => {
    const result = await choisirOption();
    expect(result).toBe(1); 
  });

  test('main should execute menu options', async () => {
    const spyLog = jest.spyOn(console, 'log').mockImplementation(() => {});
    const spyClose = jest.spyOn(rl, 'close');
    
    await main();
    
    expect(spyLog).toHaveBeenCalledTimes(6); 
    expect(spyClose).toHaveBeenCalled(); 
    spyLog.mockRestore();
    spyClose.mockRestore();
  });

  test('attendre should wait for the specified time', async () => {
    jest.useFakeTimers();
    const waitTime = 3000; // Temps d'attente simulé

    const promise = attendre(waitTime);
    jest.advanceTimersByTime(waitTime);

    await promise;
    expect(setTimeout).toHaveBeenCalledTimes(1);
    expect(setTimeout).toHaveBeenLastCalledWith(expect.any(Function), waitTime);
  });

});
