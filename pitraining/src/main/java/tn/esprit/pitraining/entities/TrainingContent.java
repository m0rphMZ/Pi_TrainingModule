package tn.esprit.pitraining.entities;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.EnumType;
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
public class TrainingContent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private ContentType type;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String contentUrl;

    private Integer duration;

    @ManyToOne // Optional One-to-One relationship with Quiz
    @JoinColumn(name = "quiz_id", nullable = true) // Nullable foreign key for optional quiz
    private Quiz quiz;

    @OneToMany(mappedBy = "trainingContent") // Mapped by field in UserTrainingContent
    private List<UserTrainingContent> userTrainingContents;

    public enum ContentType {
        MODULE,
        DOCUMENT,
        VIDEO,
        PRESENTATION
    }
}