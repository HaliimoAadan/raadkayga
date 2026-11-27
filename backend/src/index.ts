import 'dotenv/config';
import express from 'express';
import cors from 'cors';

const app = express();
const port = Number(process.env.PORT ?? 4000);

app.use(cors({ origin: process.env.CORS_ORIGIN ?? 'http://localhost:5000' }));
app.use(express.json());

// Friendly message when you open the API address in a browser
app.get('/', (_req, res) => {
  res.send('Raadkayga API is running. Try /api/health');
});

// Health check: used later by Flutter and by the hosting service to see if the API is up
app.get('/api/health', (_req, res) => {
  res.json({ status: 'running', name: 'Raadkayga API' });
});

app.listen(port, () => {
  console.log(`Raadkayga API is running on http://localhost:${port}`);
});