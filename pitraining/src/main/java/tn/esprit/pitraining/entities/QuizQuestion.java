package tn.esprit.pitraining.entities;

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Lombok annotation for getters, setters, equals, and hashCode
@AllArgsConstructor // Lombok annotation for full constructor
@NoArgsConstructor // Lombok annotation for empty constructor
@Entity
public class QuizQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String questionText;

    @Enumerated(EnumType.STRING)
    private QuestionType type; // Type of answer format

    @Column(columnDefinition = "TEXT")
    private String answerOptions; // String containing answer options (format depends on type)

    @ManyToOne
    @JoinColumn(name = "quiz_id", nullable = false) // Not nullable foreign key for Quiz
    private Quiz quiz;

    public enum QuestionType {
        SINGLE_CHOICE,
        MULTIPLE_CHOICE,
        TRUE_FALSE
    }
}
