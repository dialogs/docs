Server
=============

.. graphviz::

	digraph G {
		App [shape=box];
		PostgreSQL [shape=box];
		App -> PostgreSQL [label=5432];
	}