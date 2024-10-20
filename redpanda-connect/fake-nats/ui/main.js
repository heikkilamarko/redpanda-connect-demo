import 'bootstrap/dist/css/bootstrap.css';
import { wsconnect } from '@nats-io/nats-core';

document.addEventListener('DOMContentLoaded', async (_event) => {
	const nc = await wsconnect({
		servers: 'ws://localhost:9222',
		name: 'ui',
		timeout: 120_000,
		maxReconnectAttempts: -1,
		waitOnFirstConnect: true
	});

	const sub = nc.subscribe('demo.messages');

	(async () => {
		for await (const msg of sub) {
			handleMsg(msg);
		}
	})();
});

function handleMsg(msg) {
	try {
		const joke = msg.json()?.joke?.value ?? '<empty>';
		const message = document.createElement('div');
		message.classList = 'alert alert-info p-3 my-2 text-break';
		message.textContent = joke;
		document.querySelector('#messages').prepend(message);
		message.animate(
			[
				{ transform: 'translateX(-100px)', opacity: 0 },
				{ transform: 'translateX(0)', opacity: 1 }
			],
			{
				duration: 400
			}
		);
	} catch (err) {
		console.error(err);
	}
}
