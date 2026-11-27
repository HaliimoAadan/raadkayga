import { describe, it, expect } from 'vitest';
import request from 'supertest';
import { createApp } from '../src/app';

describe('GET /api/health', () => {
  it('reports that the API is running', async () => {
    const res = await request(createApp()).get('/api/health');

    expect(res.status).toBe(200);
    expect(res.body).toEqual({ status: 'running', name: 'Raadkayga API' });
  });
});

describe('unknown routes', () => {
  it('return 404', async () => {
    const res = await request(createApp()).get('/does-not-exist');
    expect(res.status).toBe(404);
  });
});