SELECT PARTY,COUNT(PARTY) FROM CANDIDATES WHERE ID IN(
SELECT CANDIDATE_ID FROM RESULTS WHERE VOTES IN(
SELECT MAX(VOTES) FROM RESULTS GROUP BY CONSTITUENCY_ID)) GROUP BY PARTY ORDER BY 2 DESC;