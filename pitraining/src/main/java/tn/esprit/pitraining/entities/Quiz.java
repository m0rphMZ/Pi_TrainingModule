package tn.esprit.pitraining.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data // Lombok annotation for getters, setters, equals, and hashCode
@AllArgsConstructor // Lombok annotation for full constructor
@NoArgsConstructor // Lombok annotation for empty constructor
@Entity
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long quiz_id;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private Integer passingScore;

    @ManyToOne // Optional Many-to-One relationship with TrainingContent
    @JoinColumn(name = "training_content_id", nullable = true) // Nullable foreign key for optional association
    private TrainingContent trainingContent;

    @OneToMany(mappedBy = "quiz") // Mapped by field in QuizQuestion
    private List<QuizQuestion> questions;
}
