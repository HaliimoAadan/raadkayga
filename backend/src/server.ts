import 'dotenv/config';
import { createApp } from './app';

const port = Number(process.env.PORT ?? 4000);

createApp().listen(port, () => {
  console.log(`Raadkayga API is running on http://localhost:${port}`);
});