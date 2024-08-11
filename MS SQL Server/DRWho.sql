SELECT * FROM tblEpisode e
INNER JOIN tblDoctor d ON e.DoctorId = D.DoctorId
WHERE d.DoctorName = 'Matt Smith'
--
SELECT * FROM tblEpisode e
INNER JOIN tblAuthor a ON e.AuthorId = a.AuthorId
WHERE a.AuthorName = 'Steven Moffat'
--
SELECT * FROM tblDoctor d
INNER JOIN tblEpisode e ON d.DoctorId = e.DoctorId
INNER JOIN  tblEpisodeCompanion ec ON e.EpisodeId = ec.EpisodeId
INNER JOIN tblCompanion c ON ec.CompanionId = c.CompanionId
GROUP BY c.CompanionName
--
SELECT c.CompanionName, COUNT(*) FROM tblDoctor d
INNER JOIN tblEpisode e ON d.DoctorId = e.DoctorId
INNER JOIN  tblEpisodeCompanion ec ON e.EpisodeId = ec.EpisodeId
INNER JOIN tblCompanion c ON ec.CompanionId = c.CompanionId
GROUP BY c.CompanionName
--
SELECT c.CompanionName, COUNT(*) as cnt FROM tblDoctor d
INNER JOIN tblEpisode e ON d.DoctorId = e.DoctorId
INNER JOIN  tblEpisodeCompanion ec ON e.EpisodeId = ec.EpisodeId
INNER JOIN tblCompanion c ON ec.CompanionId = c.CompanionId
GROUP BY c.CompanionName
ORDER BY cnt DESC
--
SELECT TOP 3 c.CompanionName, COUNT(*) as cnt FROM tblDoctor d
INNER JOIN tblEpisode e ON d.DoctorId = e.DoctorId
INNER JOIN  tblEpisodeCompanion ec ON e.EpisodeId = ec.EpisodeId
INNER JOIN tblCompanion c ON ec.CompanionId = c.CompanionId
GROUP BY c.CompanionName
ORDER BY cnt DESC
--
SELECT TOP 3 en.CompanionName, COUNT(*) as cnt FROM tblDoctor d 
INNER JOIN tblEpisode ep ON d.DoctorId = ep.DoctorId 
INNER JOIN  tblEpisodeEnemy ee ON ep.EpisodeId = ee.EpisodeId 
INNER JOIN tblCompanion en ON ee.EnemyId = en.CompanionId 
GROUP BY en.CompanionName 
ORDER BY cnt DESC 
