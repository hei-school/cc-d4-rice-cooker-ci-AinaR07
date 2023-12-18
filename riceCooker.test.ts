import { RiceCooker } from './RiceCooker';
import { describe, test, beforeEach, expect } from '@jest/globals';



describe('RiceCooker', () => {
  let riceCooker: RiceCooker;

  beforeEach(() => {
    riceCooker = new RiceCooker();
  });

  test('cookRice should cook rice', async () => {
    const result = await riceCooker.cookRice();
    expect(result).toBeTruthy(); 
  });

  test('keepWarm should keep food warm', async () => {
    const result = await riceCooker.keepWarm();
    expect(result).toBeTruthy(); 
  });

  test('steamCook should cook food with steam', async () => {
    const result = await riceCooker.steamCook();
    expect(result).toBeTruthy(); 
  });

  test('cookSoup should cook soup', async () => {
    const result = await riceCooker.cookSoup();
    expect(result).toBeTruthy(); 
  });

  test('cookDessert should cook dessert', async () => {
    const result = await riceCooker.cookDessert();
    expect(result).toBeTruthy(); 
  });
});