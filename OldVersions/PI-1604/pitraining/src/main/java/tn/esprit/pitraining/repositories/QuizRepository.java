package tn.esprit.pitraining.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tn.esprit.pitraining.entities.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
}
