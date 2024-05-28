package com.example.goshopping.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long uno;
    private String uid;
    private String upw;
    private String ubirth;
    private String uaddr;
    private String role;

    @Builder
    public User(String uid, String upw, String ubirth, String uaddr, String role) {
        this.uid = uid;
        this.upw = upw;
        this.ubirth = ubirth;
        this.uaddr = uaddr;
        this.role = role;
    }
}
