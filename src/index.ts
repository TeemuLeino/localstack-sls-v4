import { startOfDay, differenceInSeconds } from 'date-fns';

export const hello = (event: unknown) => {
  console.log(event);
  return Promise.resolve({
    statusCode: 200,
    body: JSON.stringify({ message: `Hello, world! (${differenceInSeconds(new Date(), startOfDay(new Date()))})` }),
  });
};
