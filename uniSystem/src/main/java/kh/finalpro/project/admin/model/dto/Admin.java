package kh.finalpro.project.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Admin {

    private String memberName; 
    private String department;
    private String memberSsn;
    private String memberNo;
}
