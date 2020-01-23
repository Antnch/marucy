--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;


\connect postgres

--
-- Name: workshop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE workshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE workshop OWNER TO postgres;

--
-- Name: workshop; Type: SCHEMA; Schema: -; Owner: postgres
--

\connect workshop

CREATE SCHEMA workshop;

--
-- Name: accounts_shards; Type: TABLE; Schema: workshop; Owner: postgres
--

CREATE TABLE workshop.accounts_shards (
    account_id bigint NOT NULL,
    shard integer NOT NULL
);


ALTER TABLE workshop.accounts_shards OWNER TO postgres;

--
-- Data for Name: accounts_shards; Type: TABLE DATA; Schema: workshop; Owner: postgres
--

COPY workshop.accounts_shards (account_id, shard) FROM stdin;
0	14
1	19
2	18
3	4
4	0
5	4
6	5
7	14
8	0
9	7
10	4
11	17
12	5
13	17
14	13
15	5
16	3
17	16
18	15
19	4
20	10
21	12
22	12
23	7
24	14
25	4
26	6
27	4
28	10
29	7
30	8
31	5
32	6
33	6
34	9
35	7
36	11
37	15
38	1
39	11
40	2
41	6
42	9
43	8
44	3
45	3
46	13
47	7
48	0
49	8
50	12
51	10
52	1
53	4
54	17
55	15
56	9
57	4
58	19
59	19
60	11
61	8
62	5
63	18
64	14
65	15
66	5
67	6
68	11
69	7
70	18
71	13
72	13
73	8
74	2
75	17
76	12
77	15
78	4
79	12
80	4
81	17
82	2
83	6
84	1
85	0
86	1
87	10
88	5
89	1
90	10
91	16
92	9
93	16
94	15
95	4
96	11
97	1
98	11
99	2
100	8
101	9
102	16
103	1
104	17
105	18
106	18
107	10
108	14
109	3
110	2
111	18
112	1
113	5
114	4
115	2
116	5
117	6
118	13
119	10
120	7
121	4
122	7
123	17
124	0
125	3
126	1
127	11
128	4
129	12
130	14
131	12
132	1
133	11
134	14
135	19
136	9
137	13
138	9
139	4
140	17
141	12
142	3
143	18
144	17
145	7
146	1
147	3
148	14
149	15
150	14
151	1
152	19
153	2
154	18
155	0
156	5
157	0
158	11
159	9
160	12
161	6
162	2
163	14
164	17
165	16
166	14
167	7
168	10
169	4
170	11
171	7
172	16
173	14
174	6
175	13
176	2
177	7
178	17
179	17
180	2
181	11
182	19
183	2
184	13
185	17
186	2
187	19
188	18
189	14
190	8
191	11
192	0
193	11
194	5
195	18
196	8
197	0
198	6
199	18
200	4
201	17
202	5
203	0
204	12
205	11
206	14
207	15
208	19
209	12
210	12
211	2
212	3
213	11
214	4
215	17
216	9
217	6
218	16
219	7
220	0
221	5
222	18
223	1
224	16
225	4
226	0
227	5
228	4
229	6
230	3
231	8
232	4
233	9
234	9
235	16
236	1
237	4
238	12
239	1
240	16
241	4
242	3
243	0
244	15
245	7
246	17
247	5
248	14
249	14
250	12
251	15
252	19
253	11
254	16
255	16
256	15
257	17
258	1
259	0
260	3
261	5
262	8
263	8
264	15
265	18
266	5
267	16
268	2
269	17
270	17
271	18
272	2
273	0
274	18
275	17
276	8
277	16
278	3
279	2
280	10
281	16
282	17
283	9
284	7
285	14
286	6
287	3
288	11
289	8
290	3
291	15
292	13
293	12
294	3
295	8
296	10
297	8
298	5
299	13
300	6
301	3
302	11
303	8
304	3
305	10
306	6
307	12
308	6
309	9
310	14
311	17
312	5
313	12
314	6
315	13
316	6
317	13
318	16
319	18
320	1
321	0
322	14
323	14
324	13
325	17
326	3
327	3
328	6
329	8
330	16
331	12
332	11
333	8
334	1
335	15
336	19
337	7
338	8
339	6
340	16
341	2
342	3
343	2
344	15
345	9
346	15
347	2
348	3
349	12
350	1
351	4
352	13
353	15
354	18
355	6
356	13
357	1
358	10
359	19
360	10
361	7
362	12
363	2
364	16
365	13
366	17
367	15
368	1
369	6
370	1
371	17
372	8
373	5
374	0
375	4
376	15
377	16
378	6
379	18
380	9
381	7
382	2
383	2
384	3
385	1
386	9
387	16
388	3
389	0
390	15
391	13
392	7
393	8
394	15
395	3
396	2
397	13
398	19
399	3
400	19
401	1
402	1
403	8
404	6
405	1
406	13
407	1
408	18
409	0
410	19
411	7
412	7
413	2
414	9
415	10
416	3
417	19
418	7
419	6
420	19
421	2
422	19
423	7
424	11
425	15
426	10
427	13
428	9
429	10
430	16
431	9
432	11
433	18
434	18
435	18
436	19
437	11
438	0
439	17
440	11
441	0
442	4
443	19
444	2
445	14
446	10
447	6
448	14
449	17
450	12
451	13
452	0
453	12
454	0
455	11
456	8
457	11
458	5
459	17
460	2
461	1
462	7
463	14
464	0
465	5
466	12
467	19
468	17
469	13
470	17
471	8
472	13
473	2
474	8
475	16
476	17
477	18
478	2
479	11
480	16
481	14
482	5
483	16
484	7
485	6
486	8
487	15
488	17
489	13
490	13
491	19
492	15
493	0
494	14
495	15
496	6
497	6
498	15
499	3
500	19
501	12
502	11
503	13
504	15
505	0
506	9
507	12
508	18
509	12
510	4
511	14
512	6
513	10
514	11
515	14
516	16
517	0
518	9
519	14
520	13
521	2
522	13
523	9
524	2
525	8
526	5
527	8
528	14
529	0
530	12
531	14
532	13
533	3
534	8
535	9
536	3
537	18
538	2
539	2
540	10
541	6
542	17
543	17
544	16
545	8
546	11
547	12
548	8
549	0
550	6
551	2
552	3
553	0
554	12
555	6
556	8
557	17
558	14
559	3
560	17
561	7
562	18
563	11
564	10
565	7
566	0
567	14
568	5
569	2
570	17
571	15
572	9
573	14
574	13
575	5
576	3
577	4
578	18
579	12
580	5
581	5
582	15
583	8
584	6
585	7
586	14
587	15
588	4
589	9
590	19
591	2
592	16
593	18
594	13
595	7
596	5
597	14
598	2
599	10
600	16
601	19
602	6
603	5
604	14
605	19
606	11
607	18
608	4
609	10
610	10
611	9
612	16
613	5
614	18
615	3
616	13
617	13
618	18
619	17
620	3
621	18
622	19
623	19
624	16
625	13
626	7
627	1
628	7
629	9
630	12
631	4
632	9
633	18
634	10
635	3
636	18
637	2
638	1
639	3
640	13
641	12
642	13
643	9
644	18
645	11
646	12
647	11
648	5
649	11
650	9
651	8
652	10
653	8
654	8
655	6
656	2
657	15
658	8
659	10
660	5
661	1
662	15
663	14
664	0
665	5
666	18
667	18
668	8
669	0
670	2
671	1
672	13
673	15
674	11
675	11
676	7
677	4
678	2
679	12
680	16
681	11
682	1
683	6
684	0
685	9
686	13
687	3
688	5
689	1
690	13
691	10
692	2
693	8
694	5
695	3
696	14
697	4
698	1
699	2
700	4
701	4
702	4
703	18
704	19
705	15
706	9
707	7
708	19
709	12
710	19
711	16
712	4
713	1
714	2
715	4
716	10
717	15
718	8
719	15
720	17
721	2
722	6
723	0
724	11
725	11
726	3
727	5
728	16
729	5
730	8
731	0
732	9
733	13
734	18
735	9
736	8
737	8
738	16
739	8
740	0
741	16
742	5
743	4
744	17
745	7
746	9
747	8
748	3
749	18
750	3
751	0
752	0
753	10
754	0
755	11
756	2
757	4
758	17
759	18
760	9
761	6
762	19
763	18
764	19
765	17
766	8
767	8
768	6
769	4
770	17
771	7
772	0
773	2
774	11
775	17
776	9
777	1
778	5
779	13
780	0
781	9
782	13
783	0
784	0
785	14
786	12
787	2
788	18
789	9
790	0
791	8
792	16
793	19
794	7
795	15
796	17
797	15
798	4
799	3
800	19
801	1
802	10
803	19
804	4
805	2
806	17
807	14
808	4
809	3
810	7
811	4
812	13
813	0
814	5
815	13
816	15
817	17
818	15
819	14
820	7
821	15
822	2
823	3
824	15
825	9
826	19
827	12
828	5
829	3
830	16
831	4
832	5
833	7
834	4
835	9
836	10
837	2
838	3
839	14
840	5
841	10
842	19
843	18
844	11
845	5
846	11
847	7
848	2
849	7
850	1
851	10
852	3
853	3
854	14
855	18
856	13
857	13
858	10
859	19
860	17
861	7
862	3
863	2
864	14
865	8
866	12
867	4
868	10
869	15
870	19
871	16
872	6
873	19
874	14
875	18
876	4
877	6
878	5
879	7
880	14
881	7
882	17
883	17
884	11
885	11
886	15
887	4
888	5
889	6
890	3
891	3
892	13
893	7
894	5
895	7
896	16
897	17
898	12
899	7
900	13
901	12
902	3
903	0
904	11
905	18
906	19
907	15
908	5
909	5
910	2
911	19
912	12
913	0
914	16
915	3
916	12
917	11
918	8
919	18
920	18
921	12
922	1
923	11
924	0
925	7
926	19
927	16
928	4
929	12
930	3
931	18
932	4
933	7
934	19
935	15
936	6
937	18
938	11
939	11
940	4
941	14
942	10
943	16
944	15
945	7
946	0
947	7
948	19
949	8
950	6
951	17
952	0
953	7
954	8
955	1
956	14
957	8
958	17
959	19
960	0
961	1
962	18
963	4
964	9
965	18
966	0
967	15
968	16
969	11
970	6
971	1
972	5
973	17
974	17
975	0
976	5
977	17
978	8
979	4
980	6
981	14
982	1
983	7
984	2
985	10
986	8
987	17
988	18
989	6
990	16
991	18
992	7
993	15
994	3
995	16
996	13
997	3
998	11
999	10
1000	14
\.


--
-- Name: accounts_shards pk_accounts_shards; Type: CONSTRAINT; Schema: workshop; Owner: postgres
--

ALTER TABLE ONLY workshop.accounts_shards
    ADD CONSTRAINT pk_accounts_shards PRIMARY KEY (account_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
