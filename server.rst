Server
=============

.. blockdiag::

	blockdiag pods {
		haproxy [label="HAProxy"];
		app1 [label="App 1"];
		app2 [label="App 2"];
		postgres [label="PostgreSQL"];

		haproxy -> app1;
		haproxy -> app2;
		app1 <-> app2;
		app1 -> postgres;
	}