package city.olooe.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.util.UriComponentsBuilder;

@Data @NoArgsConstructor @AllArgsConstructor
public class Criteria {
    private String type;
    private String keyword;
}
