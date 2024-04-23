package tn.esprit.pitraining.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.esprit.pitraining.entities.Quiz;
import tn.esprit.pitraining.entities.TrainingContent;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
    List<Quiz> findByTrainingContent(TrainingContent trainingContent);
}