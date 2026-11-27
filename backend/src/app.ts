import express from 'express';
import cors from 'cors';

export function createApp() {
  const app = express();

  app.use(cors({ origin: process.env.CORS_ORIGIN ?? 'http://localhost:5000' }));
  app.use(express.json());

  app.get('/', (_req, res) => {
    res.send('Raadkayga API is running. Try /api/health');
  });

  app.get('/api/health', (_req, res) => {
    res.json({ status: 'running', name: 'Raadkayga API' });
  });

  return app;
}