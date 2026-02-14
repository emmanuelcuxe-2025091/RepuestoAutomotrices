package com.emmanuelcuxe.RepuestosAutomotrices.controller;

import com.emmanuelcuxe.RepuestosAutomotrices.entity.Repuesto;
import com.emmanuelcuxe.RepuestosAutomotrices.service.RepuestoService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/repuestos")

public class RepuestoController {
    private final RepuestoService repuestoService;

    public RepuestoController(RepuestoService repuestoService) {
        this.repuestoService = repuestoService;
    }

    @GetMapping
    public List<Repuesto> getAllRepuesto() {
        return repuestoService.getAllRepuestos();
    }

    @PostMapping
    public ResponseEntity<Object> createRepuesto(@Valid @RequestBody Repuesto repuesto) {
        try {
            Repuesto createRepuesto = repuestoService.saveRepuesto(repuesto);
            return new ResponseEntity<>(createRepuesto, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> updateRepuesto(@PathVariable Integer id, @Valid @RequestBody Repuesto repuesto) {
        try {
            Repuesto updateRepuesto = repuestoService.updateRepuesto(id, repuesto);
            return new ResponseEntity<>(updateRepuesto, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteRepuesto(@Valid @PathVariable Integer id) {
        try {
            repuestoService.deleteRepuesto(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}